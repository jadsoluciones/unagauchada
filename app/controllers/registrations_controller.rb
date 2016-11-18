class RegistrationsController < Devise::RegistrationsController
  # Vamos a sobreescribir el método update de Devise, que se ejecuta cuando hacemos un submit desde la edición de perfil.
  # Para eso, nos valemos de la herencia (programación orientada a objetos): sobreescribimos el método update para agregarle la integración con Cloudinary, son 'super' llamamos al método update del padre para que siga el flujo normal de ejecución.

  def update
    image_update = upload_image_to_cloudinary(params[:usuario][:image])
    current_user.save if image_update
    super
  end

  private

  def upload_image_to_cloudinary(image)
    return false if image.nil?
    hash = Cloudinary::Uploader.upload(image)
    current_user.cloudinary_id = hash["public_id"]
    current_user.image_url     = hash["secure_url"]
    true
  end

  protected

    def after_update_path_for(resource)
      usuario_path(resource)
    end

end
