<script setup>
const props = defineProps({
    image: {
        type: String,
        required: true,
    },
    height: {
        type: Number,
        default: 120,
    },
});
</script>

<template>
  <div
    :class="`bg-center h-${props.height} bg-cover bg-no-repeat bg-body-img bg-fixed container flex items-center justify-center mx-auto`"
    :style="{ backgroundImage: `url(${props.image})` }"
  >
    <slot name="content" />
  </div>
</template>
