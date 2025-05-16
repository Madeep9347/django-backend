from rest_framework import serializers
from .models import Item, Cart, Order

class ItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = Item
        fields = '__all__'

class CartSerializer(serializers.ModelSerializer):
    item = ItemSerializer()

    class Meta:
        model = Cart
        fields = ['id', 'item', 'quantity']

class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = ['id', 'name', 'address', 'pincode', 'mobile', 'created_at']

    def create(self, validated_data):
        user = self.context['request'].user
        return Order.objects.create(user=user, **validated_data)
