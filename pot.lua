pot=class()

pot.coins={}

function pot:draw()
    for a,b in pairs(self.coins) do
        pushMatrix()
        fill(255)
        translate(b.x,b.y)
        rotate(b.angle)
        stroke(0, 124, 255, 255)
        strokeWidth(2)
        --ellipse(0,0,80)
        sprite("Project:"..b.name,0,0,80)
        fill(255,0,0)
        text(b.name,0,0)
        popMatrix()
    end
end

function pot:touched(t)
    if t.state==BEGAN then
        if t.x>WIDTH/2-100 and t.x<WIDTH/2+100 and
            t.y>HEIGHT/2-100 and t.y<HEIGHT/2+100 then
            addPot=true
        end
    end
    if t.state==ENDED and addPot then
        addPot=false
        if t.y<HEIGHT/2-225 then
            pot:add(1)
        elseif t.x>WIDTH/2+225 then
            pot:add(5)
        elseif t.y>HEIGHT/2+225 then
            pot:add(9)
        elseif t.x<WIDTH/2-225 then
            pot:add(13)
        end
    end   
end

function pot:add(pos)
    for a,b in pairs(self.countoins) do
        if b.v==1 then
            tab[pos].count=tab[pos].c+1
        end
        if b.v==5 then
            tab[pos+1].count=tab[pos+1].c+1
        end
        if b.v==10 then
            tab[pos+2].count=tab[pos+2].c+1
        end
        if b.v==25 then
            tab[pos+3].count=tab[pos+3].c+1
        end
    end  
    self.countoins={} 
end
