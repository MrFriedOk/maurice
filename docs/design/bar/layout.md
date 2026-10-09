# Layout
How the files, directories and overall code is laid out.
Thank you github user *Rexcrazy804* for the examples I used. 

## Bar
The master dir for the bar (taskbar).
### Generics
These files include `.qml` files that will be referenced across the whole bar element.
### Containers
Below the `Layers`, these files hold widgets placed in different parts of the bar.
#### What Files?
Bars can be broken down into three different 'containers', left, middle and right. Widgets will be referenced here and creating containers allows versatility, widgets can be moved around with simple changes to the code.
### Layers
