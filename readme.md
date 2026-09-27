# Roda Phlex render

Without the plugin
```ruby
r.is "play" do
  View::Layout::Main.new(
    title: "Play",
    body: View::Play
  ).call
end
```

With the plugin:
```ruby
plugin :phlex_render

r.is "play" do
  View::Layout::Main.new(
    title: "Play",
    body: View::Play
  )
end
```