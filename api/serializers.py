from rest_framework import serializers
from .models import Item, Cart

class ItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = Item
        fields = '__all__'

class CartSerializer(serializers.ModelSerializer):
    item = ItemSerializer()  # Nesting item details inside cart response

    class Meta:
        model = Cart
        fields = ['id', 'item', 'quantity']
