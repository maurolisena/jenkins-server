import com.cloudbees.plugins.credentials.*
import com.cloudbees.plugins.credentials.domains.*
import com.cloudbees.plugins.credentials.impl.*
import jenkins.model.*
import hudson.util.Secret

def instance = Jenkins.getInstance()
def store = instance.getExtensionList('com.cloudbees.plugins.credentials.SystemCredentialsProvider')[0].getStore()
def sonarToken = System.getenv("SONARQUBE_TOKEN") ?: "default-token"

def credentials = new StringCredentialsImpl(
        CredentialsScope.GLOBAL,
        "sonar-token",  // ID
        "Token for SonarQube",
        Secret.fromString(sonarToken)
)

store.addCredentials(Domain.global(), credentials)