//
//  Shaders.metal
//  SibeGameEngine
//
//  Created by admin on 21.06.2024.
//

#include <metal_stdlib>
using namespace metal;

struct VertexIn {
    float3 position [[attribute(0)]];
    float4 color [[attribute(1)]];
};

struct RasterizationData {
    float4 position [[position]];
    float4 color;
};

struct ModelConstant {
    float4x4 model_matrix;
};

struct SceneConstants {
    float4x4 view_matrix;
};

vertex RasterizationData basic_vertex_shader(const VertexIn v_in [[stage_in]],
                                             constant ModelConstant &model_constants [[buffer(2)]],
                                             constant SceneConstants &scene_constants [[buffer(1)]]) {
    RasterizationData rd;
    
    rd.position = scene_constants.view_matrix * model_constants.model_matrix * float4(v_in.position, 1);
    rd.color = v_in.color;
    
    return rd;
}

fragment half4 basic_fragment_shader(RasterizationData rd [[stage_in]]) {
    float4 color = rd.color;
    
    return half4(color);
}
