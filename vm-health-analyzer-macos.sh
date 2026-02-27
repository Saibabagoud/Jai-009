#!/bin/bash

# VM Health Analyzer Script for macOS

# Function to check CPU usage
check_cpu_usage() {
    echo "Checking CPU usage..."
    cpu_usage=$(ps -A -o %cpu | awk '{sum+=$1} END {print sum}')
    echo "Total CPU Usage: $cpu_usage%"
}

# Function to check memory usage
check_memory_usage() {
    echo "Checking Memory usage..."
    memory_usage=$(vm_stat | grep 'Pages active' | awk '{print $3}')
    echo "Active Memory Pages: $memory_usage"
}

# Function to check disk usage
check_disk_usage() {
    echo "Checking Disk usage..."
    disk_usage=$(df -h | grep '/$' | awk '{print $5}')
    echo "Disk Usage: $disk_usage"
}

# Running checks
check_cpu_usage
check_memory_usage
check_disk_usage

# On-demand explanations
cat << EOF

### Explanations:
1. **CPU Usage**: This indicates how much of the CPU is being used. A high percentage may indicate that the system is under heavy load.
2. **Memory Usage**: Active memory pages indicate how much memory is currently in use by processes. High memory usage could lead to swapping which can degrade performance.
3. **Disk Usage**: This shows how much disk space is being utilized. If the disk usage is above a certain threshold (like 80%), it may lead to performance issues.

EOF
