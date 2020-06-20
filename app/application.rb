
class Application

  def call(arg)
    resp = Rack::Response.new
    req = Rack::Request.new(arg)

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      resp.write text = handle_item(item)
      if text == "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found :("
      resp.status = 404
    end  

    resp.finish
  end

  def handle_item(item)
    Item.all.each do |thing|
      if thing.name == item
        return thing.price.to_s
      end
    end
    "Item not found"
  end
end
