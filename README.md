<h1>ポートフォリオ-ランド</h1>
この作品は学生たちが作ったアプリやサービスをより多くの人に
知ってもらうために作ったアプリです.
<h2>技術スタック</h2>
<ol>
  <li>ruby on rails</li>
  <li>html</li>
  <li>scss</li>
  <li>javascript(jquery)</li>
  <li>bulma rails</li>
</ol>

<h1>機能</h1>
<ul>
  <h3>基本機能</h3>
  <li>新規ユーザ登録</li>
  <li>ログイン機能</li>
  <li>プロダクト一覧機能</li>
  <li>プログラマー一覧機能</li>
  <h3>ログイン後</h3>
  <li>プロダクト一覧機能</li>
  <li>プロダクト投稿機能</li>
  <li>プロダクト編集機能</li>
  <li>プロダクト削除機能</li>
  <li>プロダクト閲覧機能</li>
  <li>いいね機能(ajax)</li>
  <li>ユーザアカウント編集機能</li>
  <li>フォロー機能</li>
  <li>コメント投稿削除機能(ajax)</li>
  <li>ログアウト機能</li>
</ul>

<h1>カラム</h1>
<h2>テーブル Products</h2>
<table border="1">
  <tr>
    <th></th>
    <th>カラム</th>
  </tr>
  <tr>
    <td>Primary key</td>
    <td>id</td>
  </tr>
  <tr>
    <td>Foreign key</td>
    <td>user_id</td>
  </tr>
  <tr>
    <td></td>
    <td>title</td>
  </tr>
  <tr>
    <td></td>
    <td>content</td>
  </tr>
  <tr>
    <td></td>
    <td>image_id</td>
  </tr>
  <tr>
    <td></td>
    <td>span</td>
  </tr>
  <tr>
    <td></td>
    <td>tech</td>
  </tr>
  <tr>
    <td></td>
    <td>commitment</td>
  </tr>
  <tr>
    <td></td>
    <td>github</td>
  </tr>
  <tr>
    <td></td>
    <td>link</td>
  </tr>
  <tr>
    <td></td>
    <td>updated_at</td>
  </tr>
  <tr>
    <td></td>
    <td>created_at</td>
  </tr>
</table>

<h2>テーブル Users</h2>
<table border="1">
  <tr>
    <th></th>
    <th>カラム</th>
  </tr>
  <tr>
    <td>Primary key</td>
    <td>id</td>
  </tr>
  <tr>
    <td></td>
    <td>username</td>
  </tr>
  <tr>
    <td></td>
    <td>email</td>
  </tr>
  <tr>
    <td></td>
    <td>profile_image_id</td>
  </tr>
  <tr>
    <td></td>
    <td>profile</td>
  </tr>
  <tr>
    <td></td>
    <td>created_at</td>
  </tr>
  <tr>
    <td></td>
    <td>updated_at</td>
  </tr>
</table>

<h2>テーブル favrites</h2>
<table border="1">
  <tr>
    <th></th>
    <th>カラム</th>
  </tr>
  <tr>
    <td>Primary key</td>
    <td>id</td>
  </tr>
  <tr>
    <td>Foreign key</td>
    <td>user_id</td>
  </tr>
  <tr>
    <td>Foreign key</td>
    <td>created_at</td>
  </tr>
  <tr>
    <td></td>
    <td>created_at</td>
  </tr>
  <tr>
    <td></td>
    <td>updated_at</td>
  </tr>
</table>

<h2>テーブル relationships</h2>
<table border="1">
  <tr>
    <th></th>
    <th>カラム</th>
  </tr>
  <tr>
    <td>Primary key</td>
    <td>id</td>
  </tr>
  <tr>
    <td>Foreign key</td>
    <td>following_id</td>
  </tr>
  <tr>
    <td>Foreign key</td>
    <td>follower_id</td>
  </tr>
  <tr>
    <td></td>
    <td>created_at</td>
  </tr>
  <tr>
    <td></td>
    <td>updated_at</td>
  </tr>
</table>

<h2>テーブル comments</h2>
<table border="1">
  <tr>
    <th></th>
    <th>カラム</th>
  </tr>
  <tr>
    <td>Primary key</td>
    <td>id</td>
  </tr>
  <tr>
    <td>Foreign key</td>
    <td>user_id</td>
  </tr>
  <tr>
    <td>Foreign key</td>
    <td>product_id</td>
  </tr>
  <tr>
    <td></td>
    <td>comment</td>
  </tr>
  <tr>
    <td></td>
    <td>created_at</td>
  </tr>
  <tr>
    <td></td>
    <td>updated_at</td>
  </tr>
</table>
