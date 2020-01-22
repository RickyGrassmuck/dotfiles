
UL="/usr/local"
OPTDIR="${UL}/opt"

# Path building export
CUST_PATH=""
CUST_PATH+="${UL}/bin:"
CUST_PATH+="${UL}/sbin:"
CUST_PATH+="${OPTDIR}/curl/bin:"
CUST_PATH+="${OPTDIR}/gnutls/bin:"
CUST_PATH+="${HOME}/.python/bin:"
CUST_PATH+="${HOME}/Development/bin:"
CUST_PATH+="${HOME}/Library/Python/3.7/bin:"
PATH="${CUST_PATH}${PATH}"
export PATH

# ZSH Config Exports
export ANTIBODY_HOME="${ZSH_CUSTOM}/plugins"
export UPDATE_ZSH_DAYS=13

# Development Exports
export GOPATH="${HOME}/go"

# System Config Exports
export HOMEBREW_NO_ANALYTICS=1
export DYLD_FALLBACK_LIBRARY_PATH="${OPTDIR}/openssl/lib"

