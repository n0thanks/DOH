function love.load()
    love.window.setTitle("DOH!")
    -- icon = love.window.getIcon("woohoo.png")
    -- love.window.setIcon(icon)

    bground = love.graphics.newImage("gbground.jfif")
    bmusic = love.audio.newSource("Cipher2.mp3", "stream")
    bmusic:setLooping(true)
    doh = love.audio.newSource("doh.mp3", "static")
    bmusic:play()

    target = {}
    target.x = 400
    target.y = 300
    target.radius = 50

    score = 0
    timer = 0

    gameFont = love.graphics.newFont(30)
end

function love.update(dt)
    
end

function love.draw()
    love.graphics.draw(bground)

    love.graphics.setColor(1,0,0)
    love.graphics.circle("fill",target.x,target.y,target.radius)

    love.graphics.setColor(1,1,1)
    love.graphics.setFont(gameFont)
    love.graphics.print(score,0,0)
end

function love.mousepressed(x,y,button)
    if button == 1 then
        local mouseToTarget = distanceBetween(x,y,target.x,target.y)
        if mouseToTarget <= target.radius then
            doh:play()
            score = score + 1
            target.x = math.random(target.radius,love.graphics.getWidth() - target.radius)
            target.y = math.random(target.radius,love.graphics.getHeight() - target.radius)
        end
    end
end

function distanceBetween(x1, y1, x2, y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end

function love.keypressed(key)
    if key == "m" then
        bmusic:pause()
    end
end
