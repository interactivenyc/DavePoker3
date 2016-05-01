Dime = class(coin)

function Dime:init(x,y,a)
    -- you can accept and set parameters here
    self:setup(x,y,a)
    self.value = 10
    self.size = 55
    self.name = "dime"
end