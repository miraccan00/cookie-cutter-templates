import json
import os
import subprocess
import yaml
import requests
from git import Repo

# GitHub API Token and user details
GITHUB_TOKEN = os.getenv("GITHUB_TOKEN")
GITHUB_USER = os.getenv("GITHUB_USER")
REPO_NAME =  "RepoName"  # Name of the repository to be created

# Read data from api.json (simulating API data)
with open('/app/api.json', 'r') as f:
    data = json.load(f)

# Generate cookiecutter configuration file
with open('cookiecutter-django-template/cookiecutter.json', 'w') as f:
    json.dump(data, f)

# Run cookiecutter to create the project (non-interactive mode)
subprocess.run(["cookiecutter", "cookiecutter-django-template", "--no-input"])

# Determine project directory from the generated data
project_dir = data["project_name"]

# Create application-manifest.yml in the project directory
manifest_data = {
    "application": {
        "name": data["project_name"],
        "creator": data["project_creator"],
        "type": data["component_type"],
        "version": data["version"]
    }
}

with open(f"{project_dir}/application-manifest.yml", 'w') as manifest_file:
    yaml.dump(manifest_data, manifest_file, default_flow_style=False)

# Remove the temporary cookiecutter.json file
os.remove('cookiecutter-django-template/cookiecutter.json')

# Create a new GitHub repository using GitHub API
headers = {
    "Authorization": f"token {GITHUB_TOKEN}"
}

repo_data = {
    "name": REPO_NAME,
    "private": False  # Set to True if you want the repo to be private
}

response = requests.post(f"https://api.github.com/user/repos", json=repo_data, headers=headers)
if response.status_code == 201:
    print(f"Repository '{REPO_NAME}' created successfully.")
else:
    print(f"Failed to create repository: {response.json()}")
    exit(1)

# Set up Git in the project directory and push to GitHub
repo_url = f"https://{GITHUB_USER}:{GITHUB_TOKEN}@github.com/{GITHUB_USER}/{REPO_NAME}.git"  # Embed token in URL
repo = Repo.init(project_dir)
repo.git.add(all=True)
repo.index.commit("Initial commit")
origin = repo.create_remote("origin", repo_url)
origin.push(refspec="HEAD:main")  # Push to the main branch

