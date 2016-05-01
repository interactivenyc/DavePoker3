Nickel = class(coin)

function Nickel:init(x,y,a)
    -- you can accept and set parameters here
    self:setup(x,y,a)
    self.value = 5
    self.size = 70
    self.name = "nickel"
end