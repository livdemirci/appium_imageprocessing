require 'rmagick'

# Görüntüyü yükleyin
image = Magick::Image.read('C:/Users/livde/OneDrive/Masaüstü/monalisa.jpeg').first

# Kırpma işlemi
# Kırpılacak alanın x ve y koordinatları, genişlik ve yükseklik değerleri
x = 100
y = 100
width = 200
height = 200

cropped_image = image.crop(x, y, width, height)

# Kırpılmış görüntüyü kaydedin
cropped_image.write('C:/Users/livde/OneDrive/Masaüstü/cropped_image.jpg')

puts 'Resim başarıyla kırpıldı ve kaydedildi!'
