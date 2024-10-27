class PhotoUploader < CarrierWave::Uploader::Base
  # Usa el almacenamiento que prefieras, como :file para almacenamiento local
  storage :file

  # Define el directorio donde se almacenarán las imágenes subidas
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Define los formatos permitidos para subir (opcional)
  def extension_allowlist
    %w(jpg jpeg gif png)
  end
end
