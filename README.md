# Dashkit #

### Deploying ###

1. Open `theme/package.json` and change the version number to `x.x.x`
2. Update the changelog file
3. `gulp zip` to compile theme files and create `Dashkit-x.x.x.zip`. It will create a package inside a `releases` folder.
4. Pop open the .zip and make sure it compiles and everything looks good. 
5. Upload the .zip to the platform, and include the changelog details
6. Copy the `/dist` folder to your desktop
7. Checkout the `gh-pages` branch, delete every file except `CNAME` and copy over all of contents of `/dist`
8. Commit/Push `gh-pages`, check it live to make sure it's good to go. 
9. Login as the Bootstrap admin and approve the update!