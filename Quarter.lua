Quarter = class(coin)

function Quarter:init(x,y,a)
    -- you can accept and set parameters here
    self:setup(x,y,a)
    self.value = 25
    self.size = 80
    self.name = "quarter"
end