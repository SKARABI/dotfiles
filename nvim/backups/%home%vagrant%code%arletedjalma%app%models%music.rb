Vim�UnDo� �������Q�%�^��q'~ �ϴW��*b��G                                      T͜�    _�                             ����                                                                                                                                                                                                                                                                                                                                                  V        T͘�    �             �             �                  inherits_from :post5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        T͜�     �                   class Music < ActiveRecord::Base     acts_as :post       0  validates_presence_of :quote, :title, :content          has_one :admin, through: :post   ;  has_one :attachment, as: :attachable, dependent: :destroy       +  accepts_nested_attributes_for :attachment         def cover       attachment if attachment     end         def to_param   !    "#{id}-#{title.parameterize}"     end   end5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        T͜�    �                  inherits_from :post    5��