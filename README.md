# Qualcomm Atheros Wi-Fi Reset Tool

A simple Windows Batch script designed to automatically disable and re-enable the Qualcomm Atheros Wi-Fi adapter. This is a quick fix for common issues like "Yellow Exclamation Mark" in Device Manager or intermittent Wi-Fi connectivity on ASUS laptops.

## How it works
- Automatically requests Administrator privileges.
- Uses PowerShell to identify the Qualcomm Atheros driver.
- Performs a hard reset by disabling and re-enabling the PnP device.

## Prerequisites
- Must be run as **Administrator**
- Intended for systems with Qualcomm Atheros Wi-Fi adapters.

## Usage
1. Download the `.bat` file.
2. Right-click and **Run as Administrator**.
3. Wait for the process to complete.

## Disclaimer
Use this script at your own risk. Always save your work before running, as it will temporarily disconnect your network.
