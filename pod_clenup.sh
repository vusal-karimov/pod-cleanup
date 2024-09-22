#!/bin/bash


GREEN="\033[0;32m"   # Green Color
RED="\033[0;31m"     # Red Color
NC="\033[0m"         # No Color


# Log function for informational messages
function log_info {
  echo -e ${GREEN}${1}${NC}
}


# Log function for error messages
function log_error {
  echo -e ${RED}${1}${NC}
}


# Prompt the user to enter a valid Kubernetes namespace
while true; 
do
  read -p "Please enter the Kubernetes namespace you want to target: " namespace
  if [ -z "$namespace" ]; then
    log_error "Namespace cannot be empty. Please enter a valid namespace name."
    continue
  else
    log_info "Namespace selected: ${namespace}"
    break
  fi  
done


# Present the user with a menu of statuses to select from
PS3="Please select the pod status you want to target (1-4): "
options=("ErrImagePull" "ImagePullBackOff" "CrashLoopBackOff" "Evicted" "Exit")
select status in "${options[@]}";
do
  if [ "$status" = "ErrImagePull" ] || [ "$status" = "ImagePullBackOff" ] || [ "$status" = "CrashLoopBackOff" ] || [ "$status" = "Evicted" ]; then
    log_info "Selected status: ${status}"
    log_info "Searching for and deleting pods with the status '${status}' in the namespace '${namespace}'. Please wait..."
    kubectl get pods -n "${namespace}" | grep -i "${status}" | awk '{print $1}' | xargs kubectl delete pods -n "${namespace}"
    exit 0
  elif [ "$status" = "Exit" ]; then
    log_info "Exiting the script. Goodbye!"
    exit 0
  else
    log_error "Invalid selection. Please choose a valid pod status or 'Exit' to quit."
  fi  
done