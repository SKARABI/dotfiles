Vim�UnDo� �c�����p�$�>bq ���,#�߷]�                                      T͜�    _�                             ����                                                                                                                                                                                                                                                                                                                                                             T͘�     �             �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             T͘�    �                  inherits_from :post5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             T͜�     �                  !class Recipe < ActiveRecord::Base     acts_as :post       6  validates_presence_of :title, :content, :ingredients          has_one :admin, through: :post   ;  has_one :attachment, as: :attachable, dependent: :destroy       +  accepts_nested_attributes_for :attachment         def processed_ingredients       ingredients.split(', ')     end         def cover       attachment if attachment     end         def to_param   !    "#{id}-#{title.parameterize}"     end   end5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             T͜�    �                  inherits_from :post    5��