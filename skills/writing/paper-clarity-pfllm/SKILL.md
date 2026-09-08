---
name: paper-clarity-pfllm
description: Polish research papers with PF-LLM-inspired idiomatic academic English and clear explanations of constraints, design choices, and mechanisms. Use for PF-LLM-style wording, natural systems-paper prose, or comparison with paper-clarity. Preserve technical meaning and document structure while improving phrasing and local paragraph flow.
---

# Paper Clarity — PF-LLM

> 分享说明：本文收录技能完整规则及两份参考材料，保留原文语言。可将整份 Markdown 交给 AI，并附上待编辑稿件，要求按本文规则润色；无需另外提供参考文件。正文中的工作区与构建步骤适用于具备文件访问能力的工具。

使用示例：

```text
请按这份文档中的 paper-clarity-pfllm 规则润色以下论文。
保留技术含义、证据强度和文档结构，返回修改稿及完整前后对比。
[粘贴论文，或指定可以访问的稿件文件]
```

让读者直接理解作者要说的技术含义，并顺着已有依据理解设计选择。基于 paper-clarity 的局部编辑尺度，吸收 PF-LLM 自然的学术英语用词、搭配与句法，以及对具体约束、执行过程和结果的解释方式。独立使用本技能即可，无需加载或修改原技能。

## 默认尺度

- **全面检查，局部改写。** 全面指覆盖全文，不是重写全文。每处选择足以改善理解的最小改动，可以是词组、从句或一句话。难读的长句可以拆开；若理解障碍来自句间关系，可以在同一段内调整句序和衔接。用户只授权换词时，仍限于换词。
- **改动数量由问题决定。** 不设置修改配额，也不为增加数量而修改已经清楚的句子。用户要求“多改一些”时扩大检查覆盖面，仍逐处证明修改有助于理解。
- **清楚比短更重要。** 可以用更长但具体的表达解释抽象短语；不把“更简洁”当成唯一目标。
- 默认保留章节标题、段落顺序、贡献列表、图表、论文结论和必要的章节导读。不跨段重排论证，不自动删除总结；章节或段落层面的结构性修改以用户另外提出的要求为准。
- 修改稿件时沿用原文语言，不自动翻译。向用户解释时沿用对话语言。

开始编辑前阅读 [措辞示例与边界](#appendix-examples) 和 [PF-LLM 表达方法](#appendix-pfllm-style)，分别校准局部修改尺度与句间解释方式。示例依赖上下文，不是全文替换词典；不需要访问 PF-LLM 原稿才能使用本技能。

## PF-LLM 带来的编辑重点

- **同时改进英文用词与搭配。** 选择语义准确、学术论文中自然的动词和词组，如 require、control、restrict、generate、remain available；修正生硬介词、名词连缀和中式搭配。参考文献中的原句、搭配及适用边界见 [用词与句法](#pfllm-wording)。它们是语境示范，不是逐词替换表。原句含义清楚但英语不顺时，也值得局部修改。
- **让设计选择有紧邻的理由。** 当原文已经给出限制及应对方式，却将二者隔开或压成抽象短语时，把具体限制与对应操作接起来。说明哪个瓶颈受到缓解，以及什么限制仍然存在。没有依据时不补因果。
- **用执行过程解释机制。** 需要时依次说明触发事件、输入或索引、组件执行的动作、输出去向及失败处理。只展开原文已经描述的环节，不替作者补齐架构。概览段保持概览所需的粒度。
- **明确组件分工和发生时间。** 将预测、数据准备、请求处理、失效及回退区分清楚；PF-LLM 的离线与运行时分工是示范，不是其他系统也必须采用的结构。
- **先让读者理解对象，再引入关系。** 必要时先说明边连接哪些对象，再称它为 co-access graph；专业名词可以保留，不让连续的名词短语代替解释。用同一名称跟踪同一对象，避免为了词汇变化换称呼。
- **用已有实例支撑抽象判断。** 优先使用原有图、访问过程或配置。例子里的每个具体事实都应有来源；不能把想象中的例子写成测量结果，也不自动给每段增加例子。
- **让数字回答实验问题。** 在结果附近保留工作负载、配置、比较基线及指标对象。区分观测和解释；预测更准确不自动等于应用更快。需要时把已有基准配置提前，方便读者理解后续变化。
- **收益与代价具体对应。** 例如说明丢弃副本减少了复制，但可能降低预取覆盖率。保留可能性及适用条件，不以泛泛的“更高效”替代权衡。

这些是可选择的写法，不是每段必须填满的模板。普通的 because、when、but 足够时就用普通连接词；保留自然的长短句变化。允许不同技能得出同一改写，也允许原句不变。学习参考论文可复用的解释方法，不搬用其标志性长句、宣传性评价或研究主张。

## 怎样判断一句话值得改

判断读者是否还需要猜：**谁执行什么操作，对什么数据，在什么条件或时间发生，结果是什么。** 只补清原文或上下文已经支持的含义。

优先处理：

- **用抽象名词掩盖动作。** 把 “eligible for predicted delivery” 改为 “can be prefetched”，让读者知道实际发生什么。
- **不恰当的比喻或主语。** 页不会自己“释放容量”；说明是卸载这些页释放了容量。图展示机制，执行操作的是系统或组件。
- **没有解释内容的拔高评价。** 将 “the defining systems property” 改为 “a characteristic”；用已有的事实或具体关系代替 “high-value” 一类无解释评价。
- **关系、条件或指代藏在句子里。** 说明某个标签与页状态分别管理、数据使用前已被逐出、写入前需要哪个副本。必要时拆句，让条件紧邻它限定的主张。
- **过度压缩的指标或时间表述。** 在原文支持时，说清归一化的分母、预取完成与需求到达的先后关系，以及实验测量的对象。
- **强行换词造成的含义漂移。** 同一对象使用稳定术语；只有语义等价时才统一词汇。

完成一处改写后，问：读者现在能否更直接理解原来的意思？如果只是词语更“高级”、更像模板或更短，应撤回该改写。

## 技术与文体边界

- 保留数值、单位、公式、引文、图表引用、组件名、基线名和术语的准确含义。格式上的等价调整不等于允许改动数值。
- 保留条件与证据强度：预测与实际发生、仿真与实测、局部内存服务与应用运行时间、相关性与因果性、可能与必然不可互换。
- **不使用机械禁词表。** `robust`、`orthogonal`、`significant`、`ideal` 等词可能有严格的技术含义；有定义或证据时应保留。只有在本句中抽象、夸饰或难理解时才改。
- 保留有技术作用的对比、被动语态、冒号、总结和必要重复。不要为了套用“去 AI 味”规则而破坏学术表达。
- 不把所有专业词换成日常词。面向该领域读者的常用术语可以保留；难懂的压缩短语可以展开解释，且不改变其定义。
- 不能由上下文确定含义时，不靠措辞改写发明机制、阈值、指标定义或研究结论。先完成其他可确定的修改，再单独列出确实需要作者判断的问题。
- 发现技术矛盾或缺失实验属于内容问题。与措辞修改分开报告，不能通过“润色”悄悄消除矛盾或把待补结果写成已完成结果。
- 不判定文章是否由 AI 写作，也不给“AI 概率”。说明可观察的语言问题即可。

## 工作方式

1. **确定实际稿件和当前版本。** 用户说“当前文章”时，检查现有工作区与论文入口文件，按当地检索规则找到实际编译的章节。检查已有改动；用户回退后以当前文件为准。已有稿件与上下文足够时，不要求用户重复粘贴或重新解释受众。
2. **通读后再编辑。** 包括正文实际引用的图注、表注和结论。理解核心论点、术语、读者和作者语气；不要把备选草稿、生成文件或编辑笔记当成当前正文。
3. **逐处改写。** 先解开主语、动作、条件、时间和结果，再检查相邻句子是否说明了已有的理由、执行顺序或权衡。不增加事实来使论证显得完整。保留此前认可的改动；必要的后续修正也要记录。用户只要求检查时，提供原句、问题和建议，不修改文件。
4. **记录可核对的前后对比。** 工作区编辑可直接更新授权范围内的源文件。记录本轮实际修改前的文字、最终修改后的文字及位置；合并同一处反复调整，避免把中间稿计入改动数量。保留用户或其他协作者的并行修改。
5. **复读改后的上下文。** 检查是否产生了新的重复、悬空指代、错误主语、冠词问题或技术含义变化。确认改写确实更容易读懂。
6. **按文件类型验证。** 核对 diff 中的结构、数值、单位、公式、引用和图表路径；检查修改清单与最终文件一致。LaTeX 使用项目已有构建方式验证。若本轮措辞导致新溢出，优先调整措辞；不要擅自改全局字号、页边距或图表尺寸。如构建失败，区分本轮问题和原有问题，并如实说明。

## 交付与自检

- 用户要求与原 paper-clarity 比较时，选用同一版本、同一上下文的原文分别改写，展示原文、原技能版、本技能版及具体差异。原技能版也应认真编辑；不以字数、修改数量或句式差异判定胜负。仅要求示例比较时，交付对照，不更新论文源文件。
- 交付完整修改稿。长篇工作区稿件用修改后的源文件或已编译文件链接交付，不必在聊天里粘贴全文。
- 附简短修改说明，以及本轮完整前后对比。少量修改可直接列在回复中；较多时生成可点击的对照文档，回复展示少数代表性例子。
- 只报告已核对的修改数量和实际执行的验证；不要声称已彻底消除所有难读表达。
- 有残留的内容疑问时，具体说明原句和缺少什么依据，不将它们混入已完成的措辞修改。

结束前确认：含义与条件是否保留；结构是否符合用户要求；每处修改是否改善理解；术语是否准确一致；是否有臆造；前后对比是否对应最终版本；构建与验证说明是否真实。

---

<a id="appendix-examples"></a>

## 措辞示例与边界

以下英文示例来自用户认可的论文编辑尺度；中文示例用于展示相同原则。它们依赖各自上下文，不表示原词在所有论文中都不合适。

### 用动作说明抽象表达

| 原表达 | 更清楚的表达 | 为什么改 |
|---|---|---|
| RP pages remain eligible for predicted delivery | RP pages can be prefetched | 若上下文已将 RP 定义为可预取的只读页，直接说预取。 |
| Inactive Cold pages supply an opportunity to reclaim DRAM capacity | Inactive Cold pages can be offloaded to reclaim DRAM capacity | 说明释放容量的操作是卸载这些页。 |
| Cold pages reclaim DRAM capacity | Offloading Cold pages frees DRAM capacity | 修正动作的主语。 |
| repeatedly migrating survivors | repeatedly migrating live pages | 在闪存回收上下文里明确被迁移的是仍有效的页。 |
| writes must first land in a coherent, writable copy | writes must first update a coherent, writable copy | 用写操作的实际动作代替比喻。 |
| the backing store must sustain state movement across many concurrent sandboxes | the backing store must handle data transfers for many concurrent sandboxes | 把抽象的状态移动说成数据传输。 |

这些修改并不要求删除整个句子、改变段落结构或重写相关机制。

### 把关系、时间和条件说清楚

| 原表达 | 更清楚的表达 | 适用边界 |
|---|---|---|
| lifetime tags orthogonal to the four page states | lifetime tags tracked separately from the four page states | 上下文中的 orthogonal 指分别记录，不是数学正交或统计独立。 |
| Temporal prediction supplies lead time but not useful-byte density. | Temporal prediction determines when to prefetch, but does not change how much of each fetched page will be used. | 原文已区分预取时机与每次传输中实际使用的数据比例。 |
| are evicted unreferenced | are evicted before their data is used | 仅当 unreferenced 表示自预取以来没有被需求访问使用。不要混同引用计数、指针或可达性。 |
| the abstract CPU window | the modeled CPU residency window | 原文的 window 指仿真中的驻留窗口；不是任意 CPU 时间窗口。 |
| its write history clears | no writes remain in that history | 保留原有历史窗口定义，不臆造窗口长度或清除机制。 |
| higher values indicate superior performance | higher values indicate lower memory-service latency | 仅当该指标已定义为归一化的延迟倒数；不能套用于能耗、吞吐等其他指标。 |
| Fixed-arrival, page-level replay measures memory service. | Replaying page accesses at fixed arrival times measures memory service. | 展开压缩修饰语，仍保留“页访问回放”和“固定到达时间”。 |

改写不一定更短。读者少猜一步，比少几个单词更重要。

### 保留信息，降低夸饰

| 原表达 | 更清楚的表达 |
|---|---|
| the defining systems property | a characteristic |
| a smaller but high-value stream | a smaller stream |
| This section follows that tension from system scale to the design opportunity | This section examines these constraints |
| These observations turn HBF from a generic backing store into a workload-aware tier | These observations motivate workload-aware HBF placement |
| This section turns the workload properties into an HBF-oriented Agentic CPU. | This section presents an HBF-oriented Agentic CPU based on the workload properties. |

这些例子的上下文没有给 defining 或 high-value 独立的技术定义。若它们指已定义的分类、指标或定理性质，则不应直接删除。

### 相同原则用于中文

| 原表达 | 更清楚的表达 |
|---|---|
| 该机制通过对数据生命周期的有效感知实现回收效率的提升。 | 该机制根据数据预计失效的时间安排存放位置，减少回收时需要复制的数据。 |
| 该设计为多沙箱并发执行提供了有力支撑。 | 该设计允许多个沙箱并行传输数据。 |

只有在周围文字已经说明这些具体机制时，才能这样展开。不能为了“具体”而给作者增加尚未描述的技术贡献。

### 应保留或单独询问的情况

- **数学含义：** “The basis vectors are orthogonal.” 保留 orthogonal，不能改成 separately managed。
- **统计含义：** 有检验方法和统计证据时，“statistically significant” 应保留；没有证据时，不擅自增加检验或 p 值。
- **合理的理想基线：** “Ideal DRAM” 若是实验配置名，保持名称；WAF 为 1.0 时使用 ideal 是否有必要，应由语境判断，不能机械禁用。
- **研究边界：** “Under the simulated memory-service model, performance is near DRAM.” 不能润色成“应用运行速度接近 DRAM 系统”。
- **合理的长句或被动语态：** 条件、对象和结果已经清楚时，保留原句，不为了形式统一而改写。
- **预测与事实：** “pages expected to become invalid together” 不等于“pages that become invalid together”。保留预测的不确定性。
- **技术矛盾：** 若原文把写密集访问归入只读处理，又在另一处规定写页走不同路径，不自行用更宽泛的“普通访问路径”掩盖矛盾。先标出冲突，完成其他明确的措辞修改。
- **缺少机制：** “The controller aligns requests with device characteristics.” 若不知道这里指队列、并行通道、生命周期还是别的特征，不能猜。指出需要作者明确的动作即可。

### 不合适的编辑尺度

- 因为整段“像 AI”，删除贡献列表、结论或章节导读。
- 将所有段落改成同样的“结论—细节—总结”模板。
- 把完整技术条件压缩成一句漂亮但不准确的宣传语。
- 为达到修改数量而替换普通学术用词，或轮换同义词。
- 把事实核查、实验补充或架构修改混入用户只要求的措辞编辑。

---

<a id="appendix-pfllm-style"></a>

## 从 PF-LLM 学习技术解释

参考材料：用户提供的《PF-LLM: Large Language Model Hinted Hardware Prefetching》，文件名 `PF-LLM v2.md`。以下按该稿的章节定位；短引文保留其用词，方法说明为本技能的归纳。提炼可迁移的表达方式，不要求模仿作者身份，也不依赖原文件的绝对路径。

### 1. 用具体成本解释问题为什么值得解决

**出处：§1 Introduction，ensemble selection 段；§2.2 Offline vs. Online Prefetching。**

§1 把不合适的预取选择落到两个具体后果：逐出有用缓存数据、浪费内存带宽。§2.2 把在线算法的复杂度限制落到处理器频率、亚纳秒决策预算、面积及功耗限制。

**编辑判断：** 当原文只有“受限”“开销高”“难以扩展”，查找上下文是否已有具体受限资源、触发条件及后果。若已有，把它们接起来；若没有，不给作者发明成本。不要把参考稿的频率或时间预算移植到别的系统。

### 2. 先用实例建立直觉，再说明一般方法

**出处：§1 Figure 1 的银行账户代码；§4.2 数据集生成。**

§1 将锁操作、数组遍历、结构体成员和字符串读取分别联系到预取策略，再提出从代码识别访问模式的想法。§4.2 用两个预取器、各两个 degree 对应四次仿真，说明训练数据如何产生。

**编辑判断：** 保留能说明设计关系的已有例子，并让例子的结论紧随其后。不要仅因例子较长就删掉，也不为了“通俗”加入无关类比。

### 3. 解释组件做出的具体决定

**出处：§2.1 Prefetcher Ensemble；§4.1 Input / Output。**

§2.1 将 orchestration 解释为：需求请求发给哪些子预取器，以及哪些预取请求发往下一层。§4.1 分别解释输入汇编上下文和三种输出 hint，各自控制什么。

**编辑判断：** “管理”“协调”“感知”未能说明机制时，把原文已有的输入、选择及输出展开。维持层级：方法概览说明分工，细节段才解释表项与控制步骤。不要把一段变成没有因果关系的模块清单。

### 4. 沿触发事件描述运行过程

**出处：§4.3 Offline Hinting；§4.4 LMHint Hardware Prefetcher。**

短引文：“When a load instruction is issued, its PC is used to look up the PHB.”

接着说明 hit 时取得 hint 并控制 ensemble，miss 时从内存表填充，等待期间采用默认策略。离线输出如何成为运行时输入，也通过 PHT 与 PHB 的用途连接起来。

**编辑判断：** 将悬空的“这个过程”或“该机制”改成明确组件与事件。命中、失效、回退等分支只有原文已定义时才写，且不能将逻辑顺序误写成新增的同步或原子性保证。

### 5. 让实现选择与理由相邻

**出处：§4.1 Input；§4.4 8-bit hint；§5.2 Simulation Setup。**

§4.1 说明静态二进制可以反汇编，而源码通常难以恢复，因此选择汇编输入。§4.4 用 SRAM 行宽可用性解释 8-bit 编码。§5.2 解释现成 trace 缺少所需静态汇编，所以自行编译基准以取得二进制。

**编辑判断：** “We choose X” 附近若已有理由，明确写出它回应的需求。比较要有同一维度；不能凭润色新增“唯一可行”“最优”“零开销”等结论。

### 6. 将实验结果、解释和适用范围区分开

**出处：§6.2 ablation；§6.3 web workloads；§6.5 overhead；§7.3–7.4 generalizability / limitations。**

§6.2 逐项说明增加 hint 类型后的性能变化。§6.3 先报告 web workload 的收益较小，再给出作者对原因的解释。§6.5 分别报告每次推理吞吐、整套程序处理时间与存储占用。§7 区分当前评估平台和后续适配设想。

**编辑判断：** 读者应能知道数字测量的是什么、相对谁、在什么条件下成立。没有消融或其他依据时，不把同时出现的变化写成已证明的因果；不要把模型估计写成实机结果，把未来方案写成已实现能力。

### 7. 当前论文上的尺度示范

以下是改写示范，不是 PF-LLM 引文。事实限于示例给定上下文。

**已有事实：** HBF 按整页传输；预测决定预取时间；只需一条 cache line 时，其余传输数据可能未被使用；CPU 将经常在同一使用窗口访问的行放入只读副本。

**可用表达：** “HBF transfers complete pages, so prefetching a single predicted line can still move mostly unused data. Temporal prediction determines when to fetch the page, but does not change how much of it will be used.” 后接已有的行分组方法。这样先给出接口限制，再解释时间预测尚未解决的问题。

**不合适表达：** “Packing eliminates bandwidth waste and guarantees timely delivery.” 已有事实不支持消除所有浪费或保证及时送达。

**已有事实：** 副本槽记录源及版本；写更新源版本并使相应槽失效；副本不原地更新。

**可用表达：** “Each replica slot records its line's authoritative source and version. When a write changes the source version, the affected slot is invalidated; the packed page is not updated in place.” 以写事件连接版本变化和槽失效。

**不合适表达：** “A write atomically invalidates all replicas before updating the source.” 新增了原文未定义的原子性、范围和执行顺序。

<a id="pfllm-wording"></a>

### 8. 英文用词、搭配与句法

用户希望同时学习参考论文自然的英文表达。编辑不仅检查抽象或难懂的措辞，也检查动词与宾语、介词、修饰语位置及句间指代是否符合自然的学术英语。以下短引文来自参考稿；不能据此把某位作者的语言背景当作已验证事实。

| PF-LLM 的短引文及出处 | 可迁移的用词习惯 | 使用边界 |
|---|---|---|
| “This process requires one model inference per load instruction.” (§4.3) | 用 requires 直接连接操作与必要成本；per 清楚表达计量单位。 | requires 表示必要条件；不能用它代替 may require。 |
| “This hint is not used if the selected prefetcher does not support prefetch degree control” (§4.1) | 用自然的 if 从句写适用条件，避免把条件塞进多个前置修饰语。 | 保留否定范围和原有条件，不能凭直觉扩大适用范围。 |
| “the predicted hints are collected into a single table” (§4.3) | 动词与具体对象自然搭配：collect hints into a table；描述数据去向。 | collect、store、install、issue 对应不同操作，不互换。 |
| “To provide low-latency access to these hints, we introduce a small, on-chip buffer” (§4.4) | 用短目的从句连接设计目的与组件，不必用多层抽象名词。 | 使用目的不等于证明已经达到性能目标；只有原文引入的组件才用 introduce。 |
| “In the interim, a default prefetch policy” (§4.4) | 过渡词明确表达等待期间，而非泛泛的 Furthermore。 | 若有多个并行事件，直接写 While waiting for … 更清楚；不机械追求同一词组。 |
| “Our approach introduces two primary overheads” (§6.5) | 用普通动词引出明确的成本分类，让后文逐项解释。 | 原稿没有固定分类时不凭空添加数字或强行列举。 |

#### 实际编辑时怎样选词

- **准确而平常的动词。** 让组件 predict reuse、generate hints、issue requests、track versions、invalidate entries；让参数 control aggressiveness、让限制 restrict choices。选择须符合实际机制，不能给没有决策能力的数据对象安排决策动作。
- **自然搭配胜过生硬直译。** 在表示预取质量时用 prediction accuracy、prefetch coverage；表达开销时用 incur overhead 或 require storage，并说清开销对象。比如 “reduces relative performance” 可以在语境支持下写为 “lowers memory-service performance relative to …”；不轮换指标名称。
- **名词短语适度展开。** 常见术语 memory bandwidth、cache line、erase block 保留；类似 “source-version-valid replica delivery” 的临时堆叠可展开为 “deliver replica lines whose versions match their sources”。不能把展开后的定语扩大到其他数据。
- **条件与主句自然衔接。** “When a write changes the source version, …” 可以让读者先知道触发事件。没有顺序问题时，也可以用主句加 because 或 while；不要给所有句子套同一开头。
- **保持成熟的学术语气。** 可以自然使用 We use、We choose、Our design、This allows、however、because，以及必要的被动语态。避免将正常学术词当成 AI 标记，也避免口语化替换或连续使用夸饰形容词。
- **句间指代具体。** this process 必须能对应刚说明的过程；如果可能指向两件事，改用具体操作名称。已定义对象可以自然使用 the、these 或 its，不必每次重复全称。

复读时同时问两件事：技术含义是否更易理解？英语是否更自然？仅换成更长、更稀有的词，或把明确术语换成模糊的日常词，都不算改进。

### 选择性吸收

参考稿也有修辞性较强的表述，如 “oracle-level”、 “Crucially” 和较长导读。它们不是本技能的必用词或禁用词：只在目标稿的含义和证据支持时使用。不要将获奖或作者声誉视为每句话都应模仿的依据。

输入 Markdown 含断词、拼写和排版提取痕迹，不学习这些形式。遇到参考材料内部的不一致，不把它当作通用技术规则。保持正常学术语气和必要术语，不统一改成短句、问句、粗体标题或固定的“问题—方案—收益”段落。
