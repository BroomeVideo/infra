echo "Travis push job"

# Update the stack
case ${TRAVIS_BRANCH} in
    master)
        pulumi stack select broomevideo/infra-staging
        pulumi update --yes
        ;;
    production)
        pulumi stack select broomevideo/infra-production
        pulumi update --yes
        ;;
    *)
        echo "No Pulumi stack associated with branch ${TRAVIS_BRANCH}."
        ;;
esac
