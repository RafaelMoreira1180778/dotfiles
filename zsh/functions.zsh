# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  Custom Functions
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  AWS PROFILE MANAGEMENT
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

export_aws_profile() {
    if [ -n "$1" ]; then
        export AWS_PROFILE="$1"
        echo "AWS profile set to: $AWS_PROFILE"
    else
        local PROFILE
        PROFILE=$(aws configure list-profiles | fzf --prompt="AWS profile: ")
        if [ -n "$PROFILE" ]; then
            export AWS_PROFILE="$PROFILE"
            echo "AWS profile set to: $AWS_PROFILE"
        else
            echo "No profile selected."
        fi
    fi

    if ! aws sts get-caller-identity >/dev/null 2>&1; then
        aws sso login --profile "$AWS_PROFILE"
    fi
}

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  EKS CLUSTER MANAGEMENT
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

update_eks() {
    local fetch_eks_cluster ALL PROFILES PROF

    fetch_eks_cluster() {
        local PROFILE REGIONS CLUSTERS REGION CLUSTER

        if [ -z "$AWS_PROFILE" ]; then
            export_aws_profile
        fi
        PROFILE="$AWS_PROFILE"

        echo -e "\n🚀 Fetching EKS clusters for profile: $PROFILE ☁️\n"

        REGIONS=("eu-central-1")

        for REGION in "${REGIONS[@]}"; do
            echo "🌍 Region: $REGION"

            CLUSTERS=($(aws --profile "$PROFILE" eks list-clusters --region "$REGION" --output text --query 'clusters[]'))

            if [ ${#CLUSTERS[@]} -eq 0 ]; then
                echo "❌ No EKS clusters found in $REGION."
                continue
            fi

            for CLUSTER in "${CLUSTERS[@]}"; do
                echo "☸️  Updating kubeconfig for: $CLUSTER"
                aws --profile "$PROFILE" eks update-kubeconfig --region "$REGION" --name "$CLUSTER" --alias "$CLUSTER"
            done
            echo ""
        done
    }

    ALL=false
    while [[ $# -gt 0 ]]; do
        case "$1" in
        --all) ALL=true ;;
        *)
            echo "❌ Invalid argument: $1"
            exit 1
            ;;
        esac
        shift
    done

    if [ "$ALL" = true ]; then
        PROFILES=($(aws configure list-profiles))
        for PROF in "${PROFILES[@]}"; do
            export AWS_PROFILE="$PROF"
            fetch_eks_cluster
        done
    else
        fetch_eks_cluster
    fi

    kubectl config unset current-context >/dev/null
}

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  PROXY MANAGEMENT
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

enable_proxy() {
    export HTTP_PROXY="http://zscaler.proxy.int.kn:80"
    export HTTPS_PROXY="http://zscaler.proxy.int.kn:80"
    export NO_PROXY="127.0.0.1,localhost,.int.kn,.eks.amazonaws.com"
    [ "$1" != "--silent" ] && echo "🔓 Proxy Enabled ✅"
}

disable_proxy() {
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset NO_PROXY
    echo "🔒 Proxy Disabled ❌"
}

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  COMPLETION CACHE REFRESH
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

refresh_completions() {
    local CACHE_DIR="${ZDOTDIR:=~}/.dotfiles/zsh/completions_cache"
    mkdir -p "$CACHE_DIR"

    echo "🔄 Refreshing completion cache..."
    kubectl completion zsh >"$CACHE_DIR/_kubectl" && echo "✅ kubectl completions updated"
    docker completion zsh >"$CACHE_DIR/_docker" && echo "✅ docker completions updated"
    helm completion zsh >"$CACHE_DIR/_helm" && echo "✅ helm completions updated"

    # Clear compinit cache to force reload
    rm -f ~/.zcompdump*
    echo "✅ Completions refreshed! Reload your shell with: exec zsh"
}
