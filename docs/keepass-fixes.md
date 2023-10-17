# "Error: too large number" on KeeWeb

Seen here:
- https://www.reddit.com/r/KeePass/comments/plom4o/error_too_large_number_on_keeweb/
- https://github.com/keeweb/keeweb/issues/2004

Fix:
1. Create a new KeePass database in KeeWeb

File format: KBDX 4
Key derivation function: Argon2d
Iterations: 10  Memory, KB: 64000  Parallelism: 2

2. Open the new database and the incompatible one side-by-side in KeePassXC
desktop
3. Drag and drop entries to the new database in KeePassXC desktop
4. Save the new database

