<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
<h1 style="display: none;"><?php echo $heading_title; ?></h1>
    <h1 class="general_heading">珠宝类</h1>

    <div class="products_container">
        <?php foreach ($products_zhubao as $product) { ?><div class='product_holder featured_product'>
            <div class='product_holder_inside'>

                <?php if ($product['special']) { ?>
                <?php echo '<div class="special_promo"></div>'; ?>
            <?php } ?>

            <?php if ($product['thumb']) { ?>
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
            <?php } ?>
            <div class="pr_info">
                <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                <?php if ($product['price']) { ?>
                <div class="price">
                    <?php if (!$product['special']) { ?>
                    <?php echo $product['price']; ?>
                    <?php } else { ?>
                    <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                    <?php } ?>
                </div>
                <?php } ?>
                <div class="cart"><a class='button' onclick="addToCart('<?php echo $product['product_id']; ?>');"><span>加入购物车</span></a></div>
            </div>
        </div>
    </div><?php } ?>
</div>

<h1 style="display: none;"><?php echo $heading_title; ?></h1>
<h1 class="general_heading">床上用品</h1>

<div class="products_container">
    <?php foreach ($products_bed as $product) { ?><div class='product_holder featured_product'>
        <div class='product_holder_inside'>

            <?php if ($product['special']) { ?>
            <?php echo '<div class="special_promo"></div>'; ?>
        <?php } ?>

        <?php if ($product['thumb']) { ?>
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
        <div class="pr_info">
            <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
            <?php if ($product['price']) { ?>
            <div class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                <?php } ?>
            </div>
            <?php } ?>
            <div class="cart"><a class='button' onclick="addToCart('<?php echo $product['product_id']; ?>');"><span>加入购物车</span></a></div>
        </div>
    </div>
</div><?php } ?>
</div>

<h1 style="display: none;"><?php echo $heading_title; ?></h1>
<h1 class="general_heading">日化产品</h1>

<div class="products_container">
    <?php foreach ($products_daily as $product) { ?><div class='product_holder featured_product'>
        <div class='product_holder_inside'>

            <?php if ($product['special']) { ?>
            <?php echo '<div class="special_promo"></div>'; ?>
        <?php } ?>

        <?php if ($product['thumb']) { ?>
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
        <div class="pr_info">
            <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
            <?php if ($product['price']) { ?>
            <div class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                <?php } ?>
            </div>
            <?php } ?>
            <div class="cart"><a class='button' onclick="addToCart('<?php echo $product['product_id']; ?>');"><span>加入购物车</span></a></div>
        </div>
    </div>
</div><?php } ?>
</div>

<h1 style="display: none;"><?php echo $heading_title; ?></h1>
<h1 class="general_heading">澳洲代购</h1>

<div class="products_container">
    <?php foreach ($products_daigou as $product) { ?><div class='product_holder featured_product'>
        <div class='product_holder_inside'>

            <?php if ($product['special']) { ?>
            <?php echo '<div class="special_promo"></div>'; ?>
        <?php } ?>

        <?php if ($product['thumb']) { ?>
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
        <div class="pr_info">
            <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
            <?php if ($product['price']) { ?>
            <div class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                <?php } ?>
            </div>
            <?php } ?>
            <div class="cart"><a class='button' onclick="addToCart('<?php echo $product['product_id']; ?>');"><span>加入购物车</span></a></div>
        </div>
    </div>
</div><?php } ?>
</div>

<?php echo $content_bottom; ?></div>
<?php echo $footer; ?>