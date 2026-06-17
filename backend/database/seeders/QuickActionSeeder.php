<?php

namespace Database\Seeders;

use App\Models\QuickAction;
use Illuminate\Database\Seeder;

class QuickActionSeeder extends Seeder
{
    /**
     * 小程序「保险」行业的底部菜单。
     * open 类型 → report.js web-view 打开 app3 前端 H5；prompt 类型 → 发给 AI 聊天。
     * 幂等：以 key 为唯一键，updateOrCreate 确保内容正确。
     */
    public function run(): void
    {
        // 0. 返回主页（回小程序行业选择落地页）
        $this->upsert([
            'key' => 'home', 'emoji' => '🏠', 'label' => '返回主页',
            'action_type' => 'home', 'target_path' => '/pages/industry/industry', 'sort_order' => 1,
        ]);

        // 1. 客户管理 → app3 前端 /customers
        $this->upsert([
            'key' => 'customers', 'emoji' => '👥', 'label' => '客户管理',
            'action_type' => 'open', 'target_path' => '/customers', 'target_title' => '客户管理', 'sort_order' => 10,
        ]);

        // 2. 业务跟进（子菜单：线索 / 商机 / 跟进记录）
        $pipeline = $this->upsert([
            'key' => 'pipeline', 'emoji' => '🎯', 'label' => '业务跟进',
            'action_type' => 'menu', 'sort_order' => 20,
        ]);
        if ($pipeline) {
            $subs = [
                ['emoji' => '📋', 'label' => '线索', 'desc' => '潜在客户线索', 'item_type' => 'route',
                    'route' => '/pages/report/report?path=%2Fleads&title=%E9%94%80%E5%94%AE%E7%BA%BF%E7%B4%A2', 'sort_order' => 10],
                ['emoji' => '💼', 'label' => '商机', 'desc' => '保单商机跟进', 'item_type' => 'route',
                    'route' => '/pages/report/report?path=%2Fopportunities&title=%E5%95%86%E6%9C%BA%E7%AE%A1%E7%90%86', 'sort_order' => 20],
            ];
            foreach ($subs as $sub) {
                $pipeline->items()->updateOrCreate(['label' => $sub['label']], $sub);
            }
        }

        // 3. AI 展业助手（子菜单：产品对比 / 展业话术 / 拒绝处理 / 拓客文案）
        $sales = $this->upsert([
            'key' => 'ai-sales', 'emoji' => '🚀', 'label' => '展业助手',
            'action_type' => 'menu', 'sort_order' => 30,
        ]);
        if ($sales) {
            $subs = [
                ['emoji' => '📊', 'label' => '产品对比', 'desc' => '保险产品横向对比', 'item_type' => 'prompt',
                    'prompt' => '请帮我对比几款保险产品的条款和保障范围，我需要给客户做方案设计。', 'sort_order' => 10],
                ['emoji' => '💬', 'label' => '展业话术', 'desc' => '销售开口话术', 'item_type' => 'prompt',
                    'prompt' => '请给我一套针对中年家庭客户的保险展业开口话术，要自然不生硬。', 'sort_order' => 20],
                ['emoji' => '🛡️', 'label' => '拒绝处理', 'desc' => '客户异议处理', 'item_type' => 'prompt',
                    'prompt' => '客户说"保险都是骗人的"，请帮我给出专业的异议处理话术。', 'sort_order' => 30],
                ['emoji' => '📣', 'label' => '拓客文案', 'desc' => '朋友圈/短信推广', 'item_type' => 'prompt',
                    'prompt' => '请帮我写一条适合发朋友圈的保险推广文案，要真实有温度，不要夸大宣传。', 'sort_order' => 40],
            ];
            foreach ($subs as $sub) {
                $sales->items()->updateOrCreate(['label' => $sub['label']], $sub);
            }
        }

        // 4. 理赔 & 服务（子菜单：理赔指引 / 续保提醒 / AI 客服话术）
        $service = $this->upsert([
            'key' => 'ai-service', 'emoji' => '🛎️', 'label' => '理赔服务',
            'action_type' => 'menu', 'sort_order' => 40,
        ]);
        if ($service) {
            $subs = [
                ['emoji' => '📝', 'label' => '理赔指引', 'desc' => '帮客户办理理赔', 'item_type' => 'prompt',
                    'prompt' => '请帮我给客户解释理赔流程和需要准备的材料，保险类型是：', 'sort_order' => 10],
                ['emoji' => '🔔', 'label' => '续保提醒', 'desc' => '生成续保话术', 'item_type' => 'prompt',
                    'prompt' => '请帮我生成一条温馨的续保提醒短信，客户的保单即将在下个月到期。', 'sort_order' => 20],
                ['emoji' => '💁', 'label' => '客服话术', 'desc' => '回应客户投诉/咨询', 'item_type' => 'prompt',
                    'prompt' => '客户对理赔结果不满意，请帮我给出安抚客户并解决问题的话术。', 'sort_order' => 30],
            ];
            foreach ($subs as $sub) {
                $service->items()->updateOrCreate(['label' => $sub['label']], $sub);
            }
        }

        // 5. 培训学习（子菜单：话术演练 / 合规查询 / 新人入门）
        $training = $this->upsert([
            'key' => 'ai-training', 'emoji' => '🎓', 'label' => '培训学习',
            'action_type' => 'menu', 'sort_order' => 50,
        ]);
        if ($training) {
            $subs = [
                ['emoji' => '🎭', 'label' => '话术演练', 'desc' => 'AI 扮演客户陪练', 'item_type' => 'prompt',
                    'prompt' => '请扮演一个对保险持怀疑态度的中年客户，和我进行保险销售话术演练。', 'sort_order' => 10],
                ['emoji' => '⚖️', 'label' => '合规查询', 'desc' => '条款合规性检查', 'item_type' => 'prompt',
                    'prompt' => '请帮我检查以下宣传文案是否符合保险监管合规要求：', 'sort_order' => 20],
                ['emoji' => '📚', 'label' => '新人入门', 'desc' => '保险基础知识', 'item_type' => 'prompt',
                    'prompt' => '我是保险新人，请给我讲解寿险/重疾险/医疗险的核心区别和销售要点。', 'sort_order' => 30],
            ];
            foreach ($subs as $sub) {
                $training->items()->updateOrCreate(['label' => $sub['label']], $sub);
            }
        }
    }

    private function upsert(array $attrs): ?QuickAction
    {
        return QuickAction::query()->updateOrCreate(['key' => $attrs['key']], $attrs);
    }
}
