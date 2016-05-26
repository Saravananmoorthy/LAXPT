# site.pp - main target(s)

node /checkmk0[1-9].vm.local/ {
  include checkmk_agent
}
