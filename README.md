# 🚀 My Automation Repository 🛠️

Welcome my Automation Repository!🤖

## Table of Contents 📚

- [Introduction](#introduction)
- [Scripts](#scripts)
  - [MySQL](#mysql)
  - [OpenAI](#openai)
- [Getting Started](#getting-started)

## Introduction 📝

In today's fast-paced world of DevOps, automation is key to saving time and reducing errors. This repository contains a collection of scripts and configurations that will help you automate various DevOps tasks.

## Scripts 📜


### MySQL 🐬

The `mysql` directory is your go-to place for MySQL-related automation:

- `myloader_mydumper`: A Dockerized solution for logical backup and restore at scale of MySQL databases. Utilizing: azcopy, mysql, mydumper, myloader, percona-toolkit and Dockerfile.  
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

- `chat.py`: Python script for integrating OpenAI's GPT-3 API into your automation.
- `translate.py`: Python script for language translation using OpenAI's language models.


## License 📄

This repository is licensed under the [MIT License](LICENSE), which means you can use, modify, and distribute the code as you see fit.

Feel free to contribute, open issues, or reach out if you have any questions or suggestions ! 🌟🤖🌟
