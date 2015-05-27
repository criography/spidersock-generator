{{PROJECT NAME}}
================



Migration process
-----------------

1. Run: `npm install`

2. Strings to search and replace:
	`{{PROJECT NAME}}`
	`{{PROJECT DESCRIPTION}}`
	`{{THEME URL}}`
	`{{AUTHOR}}`
	`{{AUTHOR URL}}`
	`{{VERSION}}`
	`{{THEME SLUG}}`

3. Rename theme folder from `theme-name` to: `{{THEME SLUG}}`

4. Run `composer create-project` and confirm salt generation when prompted

5. Edit `.env` file with correct DB credentials

6. Run `composer install && bundle install`

7. Replace: `dev/app/themes/{{THEME SLUG}}/screenshot.png`

8. Import your migrated DB.

9. Update DB settings in `wp-config.php`

10. In WP: activate your theme in WP admin

11. In WP: save permalinks, W3Total Cache and iThemes Security settings.

12. Rename your `siteName.scss`