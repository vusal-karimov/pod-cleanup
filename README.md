**Kubernetes Pod Cleanup Script**

This Bash script allows you to efficiently manage and clean up Kubernetes pods with specific statuses across a chosen namespace. It provides a user-friendly, interactive prompt to select a namespace and choose from common pod statuses that often require attention, such as:

•	ErrImagePull

•	ImagePullBackOff

•	CrashLoopBackOff

•	Evicted

All you have to do is go and have a coffee.

**Key Features:**

•	Interactive Namespace Selection: The script prompts you to input the target Kubernetes namespace.

•	Status-Based Pod Deletion: After selecting a pod status, the script automatically searches for and deletes pods in the specified namespace that match the chosen status.

•	Error Handling: If an invalid input is provided (e.g., an empty namespace or incorrect status selection), the script logs an error message and prompts you to try again.

•	Color-Coded Output: Informational messages and errors are color-coded for better readability.

**Usage:**

Run the script and enter the Kubernetes namespace you want to target.
Select the pod status from the provided menu.
The script will find and delete all pods matching the selected status within the chosen namespace.
