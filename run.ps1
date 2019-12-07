param(
    [string] $path = '.\robot'
)
robot --outputdir reports $path
# robot --outputdir reports -i smock .\robot => run by tags: robot --outputdir reports -i smock -i smock2 .\robot
# robot --outputdir reports .\robot