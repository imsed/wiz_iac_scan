pipeline {
    agent {
        kubernetes {
            label 'my-k8s-agent-01'
            defaultContainer 'jnlp'
            yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    some-label: wizcli
spec:
  containers:
  - name: wizcli
    image: wiziocli.azurecr.io/wizcli:latest
    command:
    - ls
    tty: true
    volumeMounts:
      - name: workspace-volume
        mountPath: /workspace
  volumes:
    - name: workspace-volume
      emptyDir: {}
"""
        }
    }
​
    environment {
        WIZ_POLICY = 'imsed-mis-policy'
        WIZ_CLIENT_ID = credentials('WIZ_CLIENT_ID')
        WIZ_CLIENT_SECRET = credentials('WIZ_CLIENT_SECRET')
    }
​
    stages {
        stage('Checkout') {
            steps {
                // This will pull your source code into the Jenkins workspace on the pod.
                checkout scm
            }
        }
        
        stage('Scan with WIZCLI') {
            steps {
                container('wizcli') {
                    // Run the commands. Now, the code should be available at /workspace within the wizcli container.
                    sh '/entrypoint auth --id $WIZ_CLIENT_ID --secret $WIZ_CLIENT_SECRET'
                    sh '/entrypoint iac scan --path /workspace -p $WIZ_POLICY'
                }
            }
        }
    }
}
