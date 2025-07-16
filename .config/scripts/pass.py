import csv
import subprocess
import os

# Define the path to your exported Bitwarden CSV file
csv_file_path = "/Users/matthewkennedy/Downloads/bitwarden_export_20250702140027.csv"  # <<<--- CHANGE THIS

# Define the GPG ID you used to initialize pass
# This can be your email address or the key ID
gpg_id = "matthew_i_kennedy@iCloud.com"  # <<<--- CHANGE THIS


def import_to_pass(name, password, username, url, notes):
    # Construct the full path for the password entry
    # You might want to categorize them, e.g., 'web/google.com'
    # For simplicity, we'll use the name directly for now
    # Ensure the pass_path is filesystem-safe
    pass_path = (
        name.replace(" ", "_")
        .replace("/", "-")
        .replace("\\", "-")
        .replace(":", "_")
        .lower()
    )
    # Basic sanitization for potential issues, adjust as needed for deeper categorization

    # Construct the content for the pass entry
    # The first line is usually the password
    content = f"{password}\n"
    if username:
        content += f"Username: {username}\n"
    if url:
        content += f"URL: {url}\n"
    if notes:
        content += f"Notes:\n{notes}\n"

    try:
        # Use subprocess to run the 'pass insert' command
        # The -m flag tells pass to read content from stdin
        # The -f flag forces overwrite if an entry exists (be careful!)
        print(f"Importing {name} to pass/{pass_path}...")
        process = subprocess.run(
            ["pass", "insert", "-m", pass_path],
            input=content.encode("utf-8"),
            check=True,
            capture_output=True,
        )
        print(f"Successfully imported {name}.")
    except subprocess.CalledProcessError as e:
        print(f"Error importing {name}: {e}")
        print(f"Stdout: {e.stdout.decode()}")
        print(f"Stderr: {e.stderr.decode()}")
    except FileNotFoundError:
        print(
            "Error: 'pass' command not found. Make sure pass is installed and in your PATH."
        )


if __name__ == "__main__":
    if not os.path.exists(csv_file_path):
        print(f"Error: CSV file not found at {csv_file_path}")
        exit(1)

    print(f"Starting import from {csv_file_path}...")
    with open(csv_file_path, mode="r", encoding="utf-8") as file:
        reader = csv.DictReader(file)
        for row in reader:
            # Adjust column names based on your Bitwarden CSV export format
            # New mapping based on: folder,favorite,type,name,notes,fields,reprompt,login_uri,login_username,login_password,login_totp
            name = row.get("name", "No Name")
            password = row.get(
                "login_password", ""
            )  # Changed from 'password' to 'login_password'
            username = row.get(
                "login_username", ""
            )  # Changed from 'username' to 'login_username'
            url = row.get(
                "login_uri", ""
            )  # Changed from 'login_uri' to 'login_uri' (already correct)
            notes = row.get("notes", "")

            # Skip entries without a password, or if you prefer to handle them manually
            if not password:
                print(f"Skipping '{name}' due to missing password.")
                continue

            import_to_pass(name, password, username, url, notes)

    print("\nImport process completed. Please verify your pass entries.")
    print(f"Remember to delete your unencrypted CSV file: {csv_file_path}")
