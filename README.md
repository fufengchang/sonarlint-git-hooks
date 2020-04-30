# sonarlint-git-hooks using step
sonarlint-git-hooks: https://github.com/fufengchang/sonarlint-git-hooks.git

#### 1. use git to clone the sonarlint-git-hooks
    git clone https://github.com/fufengchang/sonarlint-git-hooks.git
#### 2. cd to the sonarlint-git-hooks folder
    cd sonarlint-git-hooks
#### 3. start a git bash terminal
![avatar](https://raw.githubusercontent.com/fufengchang/sonarlint-git-hooks/master/image/2020-04-30%2014_46_40-sonarlint-git-hooks.png)
#### 4. execute get-and-setup-sonarlint.sh to setup sonarlint-cli
    ./get-and-setup-sonarlint.sh
#### 5. execute install.sh to install 'pre-commit' to git hooks
    ./install.sh
   when you execute install.sh, will prompt you to input a git repository path,
   for example, "C:\git\apache\jawr-core\" or "/c/git/apache/jawr-core/"
#### 6. verify install success
![avatar](https://raw.githubusercontent.com/fufengchang/sonarlint-git-hooks/master/image/2020-04-30%15_53_38-hooks.png)
#### 7. if you want to uninstall 'pre-commit' to your git hooks,you can execute uninstall.sh
    ./uninstall.sh




