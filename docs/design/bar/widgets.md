# Widgets
Track the widgets I make, how are they made? What separates them from others (impact on modularity)?

## Audio
There are a few ways to parse audio given to me. One way is to take audio information from a terminal using a `Process` with a `Timer` (can I omit a timer and just have `Process` run when something about audio changes?). Another way is using Quickshell's built-in Pipewire service. This method makes it really easy, just define a `PwNode` property that references Pipewire's default node
Something funny that I encountered is that if I set the volume to the `vol` property, which is a `real`, or a float (idk why it's named that way) to 0, it changes the text to just '0' which I don't want. I want floats in case I used percentages so I made a check to see if `vol` was \=== to `ref` (which is just a 0.00 real, not quite sure why I made it) and if it was, return `"0.00"`, a string. Otherwise (if it is greater than ref), it returns the actual volume in a 2 decimal float. Kinda weird the way I did it but I thought it was a little funny.

> [!NOTE] `real` vs. `string`
> The difference is obvious but here's an error I made,
> I was assigning the `audio.volume` of `defNode` to a `real` property. This kinda messed stuff up because that property called `toFixed(2)` which actually turns the returned value into a string already, so making it a `real` just messes things up (it wasn't returning 2 decimal places). Made it a string instead.
> This does mess up the check I made for `vol`, where if it's === to `ref`, it returns "OFF" so I just need to make another property.

### Mute Check
I decided to have the widget relay if Pipewire's default node was muted or not. This kind of taught me something interesting, QML doesn't really have `if`s.. it does but not really. I could set the widget's text to `mute ? "MUT":"VOL"` which is literally just asking (before the text is sent) whether or not the bool 'mute' is true. After the `?`, it's basically an array. If `mute` is true, 'MUT' is sent. If it isn't true, 'VOL' (the default) is sent. Interesting. Another thing I learned is that `!` can flip a boolean, I can see this being used in many ways. Like (pseudocode)
```
//when onClicked function in MouseArea gets triggered, flip the mute bool
onClicked(): mute = !mute
```

> [!NOTE]
> The way I wrote it in code is kind of gross, I should go fix it.

