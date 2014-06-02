json.array!(@facturas) do |factura|
  json.extract! factura, :id, :fecha, :eNino, :eAdulto, :eAMayor, :tNino, :tAdulto, :tAMayor, :total, :notas
  json.url factura_url(factura, format: :json)
end
