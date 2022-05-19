# homebrew-mvnmin
`brew` tap for `mvnmin`

## Create a release

1. Update `MVNMIN_VERSION` in `mvnmin.rb` to match the new release.
1. Update the `sha256` checksum in `mvnmin.rb` to match the checksum of the new release jar.
   This example works for 1.0.2
   ```
	sha256sum ~/.m2/repository/com/elasticpath/tools/mvnmin/1.0.2/mvnmin-1.0.2-jar-with-dependencies.jar
   ```
1. Commit the changes and push.
