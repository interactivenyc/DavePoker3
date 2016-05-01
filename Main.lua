displayMode(FULLSCREEN)
supportedOrientations(PORTRAIT)

function setup()
    rectMode(CENTER)
    w1,h1=230,250
    w2,h2=650,360
    w3,h3=530,775
    w4,h4=120,660
    pt=pot()
    tab={}
    table.insert(tab,coin(w1,h1,"penny",0,1))
    table.insert(tab,coin(w1+100,h1,"nickel",0,5))
    table.insert(tab,coin(w1+200,h1,"dime",0,10))
    table.insert(tab,coin(w1+300,h1,"quarter",0,25))

    table.insert(tab,coin(w2,h2,"penny",90,1))
    table.insert(tab,coin(w2,h2+100,"nickel",90,5))
    table.insert(tab,coin(w2,h2+200,"dime",90,10))
    table.insert(tab,coin(w2,h2+300,"quarter",90,25))

    table.insert(tab,coin(w3,h3,"penny",180,1))
    table.insert(tab,coin(w3-100,h3,"nickel",180,5))
    table.insert(tab,coin(w3-200,h3,"dime",180,10))
    table.insert(tab,coin(w3-300,h3,"quarter",180,25))

    table.insert(tab,coin(w4,h4,"penny",270,1))
    table.insert(tab,coin(w4,h4-100,"nickel",270,5)) 
    table.insert(tab,coin(w4,h4-200,"dime",270,10))
    table.insert(tab,coin(w4,h4-300,"quarter",270,25))    
end

function draw()
    background(40, 40, 50)
    fill(0,255,0)
    rect(WIDTH/2,HEIGHT/2,450,450)
    for a,b in pairs(tab) do
        b:draw()
    end
    pt:draw()
end

function touched(t)
    for a,b in pairs(tab) do
        b:touched(t)
    end  
    pt:touched(t)
end

pot=class()

pot.coins={}

function pot:draw()
    for a,b in pairs(self.coins) do
        pushMatrix()
        fill(255)
        translate(b.x,b.y)
        rotate(b.a)
        stroke(0, 124, 255, 255)
        strokeWidth(2)
        ellipse(0,0,80)
        fill(255,0,0)
        text(b.n,0,0)
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
    for a,b in pairs(self.coins) do
        if b.v==1 then
            tab[pos].c=tab[pos].c+1
        end
        if b.v==5 then
            tab[pos+1].c=tab[pos+1].c+1
        end
        if b.v==10 then
            tab[pos+2].c=tab[pos+2].c+1
        end
        if b.v==25 then
            tab[pos+3].c=tab[pos+3].c+1
        end
    end  
    self.coins={} 
end

coin=class()

function coin:init(x,y,n,a,v)
    self.x=x
    self.y=y
    self.ox=x
    self.oy=y
    self.c=10
    self.n=n    -- name
    self.a=a    -- rotate angle
    self.v=v    -- coin values
    self.rem=false
    self.sub=1
end

function coin:draw()    
    pushMatrix()
    fill(255)
    translate(self.x,self.y)
    rotate(self.a)
    stroke(0, 124, 255, 255)
    strokeWidth(2)
    ellipse(0,0,80)
    fill(255,0,0)
    text(self.n,0,0)
    popMatrix()

    pushMatrix()
    translate(self.ox,self.oy)
    rotate(self.a)
    fill(255)
    ellipse(0,0,80)
    fill(255,0,0)
    text(self.n,0,0)
    text(self.c,0,-60)
    text(self.v*self.c,0,-80)
    popMatrix()
end

function coin:touched(t)
    if t.x>self.ox-40 and t.x<self.ox+40 and 
            t.y>self.oy-40 and t.y<self.oy+40 and self.c>0 then
        if t.state==BEGAN then
            self.id=t.id
        end
    end
    if t.state==MOVING and self.id==t.id then
        self.x=t.x
        self.y=t.y
    end
    if t.state==ENDED and self.id==t.id then
        self.id=0
        if self.c>0 then
            self.c=self.c-1
        end
        table.insert(pt.coins,{x=self.x,y=self.y,n=self.n,a=self.a,v=self.v})
        self.x=self.ox
        self.y=self.oy
    end
end