# Eliminar todos los registros previos (opcional)
User.destroy_all
Photo.destroy_all
Comment.destroy_all

# Crear un usuario para Karina
karina = User.create!(
  name: 'Karina',
  email: 'karina@example.com',
  password: 'password123',
  password_confirmation: 'password123',
  profile_picture: File.open(Rails.root.join('public/uploads/karina_profile.jpg')) # Usando la ruta completa
)

#Crear algunos usuarios de prueba
user1 = User.create!(
  name: 'Juan Pérez',
  email: 'juan@example.com',
  password: 'password123',
  password_confirmation: 'password123',
  profile_picture: File.open(Rails.root.join('public/uploads/juan_profile.png'))

)

user2 = User.create!(
  name: 'María López',
  email: 'maria@example.com',
  password: 'password123',
  password_confirmation: 'password123',
  profile_picture: File.open(Rails.root.join('public/uploads/maria_profile.png'))

)

# # Crear algunas fotos que Karina ha subido
#begin
photo1 = karina.photos.create!(
    title: 'Atardecer en la montaña',
    description: 'Este atardecer muestra la belleza natural en su máximo esplendor.',
    image: File.open(Rails.root.join('public/uploads/photo1.jpg')) # Usando la ruta completa
)
#rescue => e
 # puts "Error al crear la foto: #{e.message}"
#end


photo2 = karina.photos.create!(
  title: 'Noche estrellada en el desierto',
  description: 'Capturando la soledad y serenidad del desierto bajo las estrellas.',
  image: File.open(Rails.root.join('public/uploads/photo2.jpg'))
)

# # Crear algunos comentarios en las fotos
photo1.comments.create!(
  content: 'Qué hermosa foto, Karina!',
  user: user1
)

photo1.comments.create!(
  content: 'Me encanta cómo capturaste el atardecer.',
  user: user2
)

photo2.comments.create!(
  content: 'El desierto nunca se vio tan pacífico.',
  user: user1
)

photo2.comments.create!(
  content: 'Me quedo sin palabras, es espectacular.',
  user: user2
)

puts 'Datos iniciales cargados exitosamente.'
