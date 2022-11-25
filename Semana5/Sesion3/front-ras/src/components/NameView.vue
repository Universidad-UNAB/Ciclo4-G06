<template>
    <div class="cardView">        
        <div class="card text-white bg-success mb-3" style="max-width: 20rem;">
            <div class="card-header">{{titleView}}</div>
        </div>
    </div>
</template>
  
<script>
export default {
    name: 'NameView',
    props: {
        titleView: String
    }
}
</script>