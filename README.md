## 押し忘れた時

```bash
heroku run rails console
@user = User.find_by(name: "名前")
@log = @user.logs.where(time_in: Time.current.in_time_zone.all_day)
@log.time_in = "年-月-日 12:00:00"

```

そのあとアプリ内で正しい時間に訂正する
