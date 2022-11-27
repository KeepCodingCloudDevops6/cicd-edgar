pipelineJob('Terraform') {
  definition {
      cpsScm {
          scm {
              git {
                  remote {
                      url("https://github.com/KeepCodingCloudDevops6/cicd-edgar.git")
                  }
                  branches("main")
                  scriptPath('Jenkinsfile')
              }
          }
      }
  }
}

pipelineJob('Storage') {
  definition {
      cpsScm {
          scm {
              git {
                  remote {
                      url("https://github.com/KeepCodingCloudDevops6/cicd-edgar.git")
                  }
                  branches("main")
                  scriptPath('Jenkinsfile.storage')
              }
          }
      }
  }
}
