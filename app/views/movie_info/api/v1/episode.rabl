object @episode
attributes :number, :title, :date
child(:movie) { attributes :en_title, :ru_title }
child(:season) { attributes :number }