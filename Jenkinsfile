pipeline {
    agent {
        kubernetes {
            label 'wizcli-agent'
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
    tty: true
    stdin: true
    volumeMounts:
      - name: workspace-volume
        mountPath: /workspace
  volumes:
    - name: workspace-volume
      emptyDir: {}
"""
        }
    }

    environment {
        WIZ_POLICY = 'imsed-mis-policy'
        WIZ_CLIENT_ID = credentials('WIZ_CLIENT_ID')
        WIZ_CLIENT_SECRET = credentials('WIZ_CLIENT_SECRET')
    }

    stages {
        stage('Checkout') {
            steps {
                // This will pull your source code into the Jenkins workspace on the pod.
                checkout scm
            }
        }
        

    }
}
