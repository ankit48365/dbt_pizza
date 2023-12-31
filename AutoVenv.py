import os
import subprocess

# Step 0: Check if the directory has already been cloned
def check_cloned_directory(directory):
    if os.path.exists(directory):
        print(f"Warning: Is the new directory to be used already been cloned from GitHub to your local machine.")

# Step 1: Ask for the parent directory
def get_parent_directory(default_directory):
    response = input(f"Is the parent directory {default_directory}? (yes/no): ")
    if response.lower() != "yes":
        default_directory = input("Please enter the new parent directory: ")
    return default_directory

# # Step 2: List directories and ask for destination directory
# def get_destination_directory(parent_directory):
#     print("Directories in the parent directory:")
#     print("\n".join(os.listdir(parent_directory)))
#     destination_directory = input("Please choose the destination directory: ")
#     return os.path.join(parent_directory, destination_directory)

def get_destination_directory(parent_directory):
    # Get a list of all items in the parent directory
    items = os.listdir(parent_directory)
    # Filter the list to include directories only
    directories = [item for item in items if os.path.isdir(os.path.join(parent_directory, item))]
    # Print the directories with numbering
    for i, directory in enumerate(directories, 1):
        print(f"{i}. {directory}")
    # Ask the user to choose a directory by number
    directory_number = int(input("Please choose the destination directory by number: "))
    # Get the chosen directory
    destination_directory = directories[directory_number - 1]
    return os.path.join(parent_directory, destination_directory)


# Step 3: Ask for the name of the virtual environment
def get_virtual_env_name():
    return input("What name would you give to your virtual environment? ")

# Step 4: Create the virtual environment
def create_virtual_env(directory, env_name):
    subprocess.run(f"python -m venv {os.path.join(directory, env_name)}", shell=True)

# Step 5: Add the virtual environment to .gitignore
def update_gitignore(directory, env_name):
    with open(os.path.join(directory, ".gitignore"), "a") as file:
        file.write(f"{env_name}/\n")

# Step 6: Activate the virtual environment
def activate_virtual_env(directory, env_name):
    subprocess.run(f"{os.path.join(directory, env_name, 'Scripts', 'activate')}", shell=True)

def main():
    default_directory = "E:\\here\\git\\"
    check_cloned_directory(default_directory)
    parent_directory = get_parent_directory(default_directory)
    destination_directory = get_destination_directory(parent_directory)
    env_name = get_virtual_env_name()
    create_virtual_env(destination_directory, env_name)
    update_gitignore(destination_directory, env_name)
    activate_virtual_env(destination_directory, env_name)

if __name__ == "__main__":
    main()
