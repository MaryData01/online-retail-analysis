# Business Recommendations — Online Retail Analysis

Based on cleaning, exploring, and visualizing 12 months of transaction data (Dec 2010 – Dec 2011) for this UK-based online gift retailer. Each point below follows the same pattern: what the data shows, why it matters, and what to actually do about it.

---

## Revenue & Growth

**1. Protect the Nov–Dec ramp-up period**
- *Finding:* Revenue climbs steadily through the year and peaks hard in November (£1.5M), before appearing to crash in December.
- *Why it matters:* The December "crash" is misleading — the dataset only covers the first 9 days of that month, not a real decline. The true story is a strong pre-Christmas surge.
- *Recommendation:* Increase inventory and staffing ahead of Q4, especially November. Treat December's partial-month figure with caution in any future reporting — don't compare it directly to full months.

**2. Reduce dependency on a single market**
- *Finding:* The UK accounts for **84.6%** of revenue. The next four countries (Netherlands, Ireland, Germany, France) each contribute only 2–3%.
- *Why it matters:* A business this concentrated in one market carries real risk — a UK-specific slowdown would hit almost the entire company.
- *Recommendation:* Explore targeted marketing or fulfillment investment in the next-tier markets (Netherlands, Ireland, Germany) where there's already some traction to build on.

---

## Customers

**3. Build a dedicated program for top-tier customers**
- *Finding:* The top 10% of customers (433 people) generate **61.3%** of total revenue. Repeat customers overall sit at a healthy **65.6%**.
- *Why it matters:* Losing even a handful of top customers would hurt far more than losing an average one. This small group is effectively carrying the business.
- *Recommendation:* Create a VIP tier — early access, dedicated support, loyalty perks — specifically for top-decile customers rather than spreading retention budget evenly.

**4. Personally reach out to high-value customers who've gone quiet**
- *Finding:* RFM segmentation split customers into 7 groups. One customer (**ID 12346**) placed a single **£77,183** order but hasn't purchased in **326 days** — flagged in the "Can't Lose Them" segment (78 customers total).
- *Why it matters:* These are proven big spenders, not guesses. A small, targeted win-back effort here could have outsized return compared to broad marketing.
- *Recommendation:* Direct outreach (personal email, phone call, or special offer) to the 78 "Can't Lose Them" customers, starting with the highest historical spenders.

**5. Time re-engagement campaigns around the proven seasonal pattern**
- *Finding:* Cohort analysis showed a genuine spike in returning customers every November — confirmed as a real seasonal effect (445 distinct customers, including several top spenders), not random noise.
- *Why it matters:* This is a predictable, recurring behavior, not a one-off. It can be planned around.
- *Recommendation:* Launch "welcome back" or early-access campaigns in early November each year, timed to this proven return pattern.

---

## Products

**6. Investigate the Regency Cakestand's return rate**
- *Finding:* REGENCY CAKESTAND 3 TIER is the **#1 product by revenue** (£174,484.74) — and also the **#1 most returned** product (180 separate return orders).
- *Why it matters:* A top earner with an unusually high return rate is losing money it shouldn't be. Fragile items like cake stands are prone to shipping damage.
- *Recommendation:* Review packaging and shipping handling for this specific product before losses grow alongside sales. Check if returns cluster around specific shipping regions or carriers.

**7. Don't mistake bulk wholesale orders for genuine popularity**
- *Finding:* "Paper Craft, Little Birdie" looked like a top seller by raw unit count (80,995 units) — but that was a **single wholesale order from one customer**, cancelled 12 minutes after being placed. By actual order count, "White Hanging Heart T-Light Holder" is the true most popular product (bought across 2,260 separate orders).
- *Why it matters:* Reporting raw quantity as "popularity" would be misleading to stakeholders and could lead to bad inventory decisions.
- *Recommendation:* Use order-count (not units sold) as the standard metric for "popularity" in future reporting. Flag single large orders separately so they don't distort rankings.

**8. Double down on the proven flagship product**
- *Finding:* "White Hanging Heart T-Light Holder" is the only product that ranks in the top 10 across all three methods — revenue, quantity, *and* order count.
- *Why it matters:* This is the most reliably in-demand item in the catalog, not a fluke of one big order.
- *Recommendation:* Feature it prominently in marketing, and consider it a safe bet for stock levels and bundling with other products.

---

## Costs & Operations

**9. Account for the true cost of returns and fees**
- *Finding:* Cancellations reduced revenue by **£896,812**. Separately, Amazon marketplace fees alone cost **£221,520**.
- *Why it matters:* The £896,812 figure likely *understates* the real cost — it doesn't include restocking labor, return shipping, or damaged/unsellable stock. Amazon fees are a meaningful, quantifiable cost of that sales channel.
- *Recommendation:* Track return-handling costs separately from lost revenue to get a true return cost. Evaluate whether Amazon-channel sales are profitable enough to justify the 2.1% fee-to-revenue ratio.

**10. Align staffing and systems with actual business hours**
- *Finding:* Zero transactions happen on Saturdays. Purchases are concentrated between 10am–3pm on weekdays, consistent with a B2B/wholesale-leaning customer base.
- *Why it matters:* Staffing, customer support, and system maintenance windows can be planned around real usage patterns instead of assumptions.
- *Recommendation:* Schedule system maintenance and non-urgent operational work for Saturdays. Ensure peak staffing covers the 10am–3pm weekday window specifically.

---

## If you only take away three things

1. **The business is UK-heavy and top-customer-dependent** — both are growth opportunities and risks at the same time.
2. **Two products (Cakestand, Little Birdie) both look "wrong" in the data, but for opposite reasons** — one has a real quality problem, the other is a reporting trap.
3. **Retention is already healthy (65.6%)** — the bigger opportunity is deepening the relationship with the top 10%, not just acquiring new customers.
