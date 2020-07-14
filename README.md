## 押し忘れ

```bash
heroku run rails console
@user = User.find_by(name: "nakashima")
@log = @user.logs.create(time_in: "2020-7-12 12:00:00", day: "2020-07-12 12:00:00", time_out: "2020-7-12 12:00:00", working_times: 0.0)
@log.save

```

日付を適宜入れ替えてください
そのあとアプリ側で正しい時間に直す
