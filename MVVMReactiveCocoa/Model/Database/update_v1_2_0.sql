create table if not exists User (userId integer, id integer, rawLogin text, login text, name text, bio text, email text, avatar_url text, blog text, company text, location text, collaborators integer, public_repos integer, owned_private_repos integer, public_gists integer, private_gists integer, followers integer, following integer, disk_usage integer, followerStatus integer, followingStatus integer, primary key (userId, id));
create table if not exists Repository (userId integer, id integer, isStarred integer, name text, owner_login text, owner_avatar_url text, description text, language text, pushed_at text, created_at text, updated_at text, clone_url text, ssh_url text, git_url text, html_url text, default_branch text, private integer, fork integer, watchers_count integer, forks_count integer, stargazers_count integer, open_issues_count integer, subscribers_count integer, primary key (userId, id, isStarred));
create table if not exists Search (id integer primary key autoincrement, keyword text, searched_at text, userId integer);