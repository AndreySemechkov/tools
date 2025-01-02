# 🛠️ Useful Tools and Scripts 🛠️

# 🌀 Free disk space by removng unused Kernels and Kernel Headers

### Requirements
- Debian-based Linux distribution
- Root/sudo privileges

Ubuntu Server, Linux Mint and other Debian-based distributions keep all old kernels use alot of storage. This is a script for Debian-based Linux distributions that safely removes old kernel versions and headers while preserving the currently running kernel. Additionally, there are scenarios when our package manager decides to keep orphaned dependencies. For instance, the make dependencies often become unnecessary after building a package. Therefore, we might want to remove them. 

### Features
- Identifies and lists outdated kernel packages
- Shows kernel modules targeted for removal
- Requires explicit confirmation to perform deletion
- Cleans up associated kernel headers and modules (Preserves the currently active kernel)
- Removes orphaned apt dependencies

### Usage
```bash
# Preview changes
chmod +x ./linux/kernels-cleanup.sh
./linux/kernels-cleanup.sh

# Execute removal
sudo ./linux/kernels-cleanup.sh exec
```



**Note:** Always verify the listed kernels before executing the removal process to prevent unintended deletions.

### MySQL 🐬

The `mysql` directory is your go-to place for MySQL-related automation:

- `backup`: A Dockerized solution for performant logical backup and restore at scale of MySQL databases. Utilizing: azcopy, mysql, mydumper, myloader, percona-toolkit and Dockerfile.  
  - `Dockerfile`: Dockerfile for creating my portable MySQL toolkit container.
  - `mysqlkit.sh`: CLI toolkit for MySQL database backup and restore. The MySQL Toolkit 🚀 supports the following commands:
    - help: Display the script's usage and available options.
    - backup: Create backups of AWS RDS DB MySQL tables and upload them to a Blob Store.
    - restore: Restore MySQL tables from Blob Storage.
    - test_script: Test the script and display some diagnostic information.
    - run_command: Execute SQL commands or MySQL Client commands.
    - restore_command: Execute restore and run_command sequentially.

### OpenAI 🧠

Need an AI assistant in your workflow? Check out the `openai` directory:

- `chat.py`: Interactive CLI for interacting with OpenAI models with customizable response formats and AI personalities.
- `translate.py`: CLI tool for translating audio files to text using OpenAI's Whisper API. Supports automatic format conversion and handles multiple audio formats.


## License 📄

This repository is licensed under the [MIT License](LICENSE), which means you can use, modify, and distribute the code as you see fit.

Feel free to contribute, open issues, or reach out if you have any questions or suggestions ! 🌟🤖🌟
