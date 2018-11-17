Procedure
=========

We are removing bad ebuilds from master. All in master must be stable.

If an application with a bad ebuild is interesting, we must create a new branch with the fullname of the ebuild, for example app-office/xulpymoney until it's fixed. Once it's fixed we merge code into master and remove other branch.

It's important to merge from master to branch after changes in application branch to make merges easier. To do this and inside application branch, I used the option with files of the especific branch updated, and it gave me conflicts
`git merge --no-ff master`
